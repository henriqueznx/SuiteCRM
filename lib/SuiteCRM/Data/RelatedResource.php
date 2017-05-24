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

use SuiteCRM\Data\RelatedResourceInterface as RelatedResourceInterface;
use SuiteCRM\Data\MetaDataInterface as MetaDataInterface;
use SuiteCRM\Data\RelatedResourceException as RelatedResourceException;

/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 *
 * Link which implements the data structure specified by json api
 * http://jsonapi.org/format/#document-links
 */
class RelatedResource implements RelatedResourceInterface, \ArrayAccess
{
    /**
     * @var string $data url
     */
    protected $href;

    /**
     * @var \SuiteCRM\Data\MetaDataInterface $meta
     */
    protected $meta;
    
    /**
     * @return string
     */ 
    public function getHref()
    {
        return $this->href;
    }
    
    /**
     * @param string $value
     * @return void
     */ 
    public function setHref($value)
    {
        if(gettype($value) !== 'string') {
            throw RelatedResourceException::invalidHrefValue($value);
        }
    }
    
    /**
     * @return \SuiteCRM\data\MetaDataInterface
     */ 
    public function getMeta()
    {
        return $this->meta;
    }
    
    /**
     * @param \SuiteCRM\Data\MetaDataInterface $meta
     * @return void
     */
    public function setMeta(MetaDataInterface $meta)
    {
        $this->meta = $mata;
    }

    /**
     * @uses \SuiteCRM\Data\DataInterface
     * @returns array
     */
    public function getData()
    {
        $response = array(
            'related' => array(
                'href' => $this->href,
                'meta' => $this->meta
            )
        );
        return array_merge_recursive($response['related'], $this->meta->getData());

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
        return $this->{$offset};
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
