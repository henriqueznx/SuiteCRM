<?php
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2017 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

namespace SuiteCRM\Data;

use SuiteCRM\Data\LinkInterface as LinkInterface;

/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 *
 * Link which implements the data structure specified by json api
 * http://jsonapi.org/format/#document-links
 */
class Link implements LinkInterface, \ArrayAccess
{
    /**
     * @var string $data string url
     */
    protected $self;

    /**
     * @var RelatedResourceInterface $included
     */
    protected $related;

    /**
     * @var string|null $first string(pagination)
     */
    protected $first;

    /**
     * @var string|null $prev url|null (pagination)
     */
    protected $prev;

    /**
     * @var string|null $next (pagination)
     */
    protected $next;

    /**
     * @var string|null $last (pagination)
     */
    protected $last;

    /**
     * @return string
     */
    public function getSelf()
    {
        return $this->self;
    }

    /**
     * @param string $self
     */
    public function setSelf($self)
    {
        $this->self = $self;
    }

    /**
     * @return RelatedResourceInterface
     */
    public function getRelated()
    {
        return $this->related;
    }

    /**
     * @param string $related
     */
    public function setRelated($related)
    {
        $this->related = $related;
    }

    /**
     * @return null|string
     */
    public function getFirst()
    {
        return $this->first;
    }

    /**
     * @param string $first
     */
    public function setFirst($first)
    {
        $this->first = $first;
    }

    /**
     * @return null|string
     */
    public function getPrev()
    {
        return $this->prev;
    }

    /**
     * @param string $prev
     */
    public function setPrev($prev)
    {
        $this->prev = $prev;
    }

    /**
     * @return null|string
     */
    public function getNext()
    {
        return $this->next;
    }

    /**
     * @param string $prev
     * @return null|string
     */
    public function setLast($prev)
    {
        return $this->prev;
    }

    /**
     * @uses DataInterface
     * @returns array
     */
    public function getData()
    {
        $response = array(
            'links' => array(
                'self' => $this->self,
                'first' => $this->first,
                'prev' => $this->prev,
                'next' => $this->next,
                'last' => $this->last
            )
        );

        return array_merge_recursive($response['links'], $this->related->getData());
    }

    /**
     * @uses ArrayAccess
     * @param string $offset
     * @return boolean
     */
    public function offsetExists($offset)
    {
        return property_exists(get_class($this), $offset);
    }

    /**
     * @uses ArrayAccess
     * @param string $offset
     * @return array|string|integer|float|bool|null
     */
    public function offsetGet($offset)
    {
        $this->{$offset};
    }

    /**
     * @uses ArrayAccess
     * @param string $offset
     * @param array|string|integer|float|bool|null $value
     * @return void
     */
    public function offsetSet($offset, $value)
    {
        $this->{$offset} = $value;
    }

    /**
     * @uses ArrayAccess
     * @param string $offset
     */
    public function offsetUnset($offset)
    {
        $this->{$offset} = null;
    }
}
