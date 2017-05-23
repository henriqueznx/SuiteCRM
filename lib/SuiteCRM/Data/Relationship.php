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

use SuiteCRM\Data\RelationshipInterface as RelationshipInterface;
use SuiteCRM\Data\ResourceIdentified as ResourceIdentified;
use SuiteCRM\Data\LinkInterface as LinkInterface;
use SuiteCRM\Data\MetaDataInterface as MetaDataInterface;

/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 *
 * Link which implements the data structure specified by json api
 * http://jsonapi.org/format/#document-links
 */
class Relationship implements RelationshipInterface, \ArrayAccess
{
    /**
     * @var \SuiteCRM\Data\ResourceIdentified $data
     */
    protected $data;

    /**
     * @var \SuiteCRM\Data\LinkInterface $links
     */
    protected $links;

    /**
     * @var \SuiteCRM\Data\MetaDataInterface $links
     */
    protected $meta;

    /**
     * @var string $name
     */
    protected $name;

    /**
     * Relationship constructor.
     * @param \SuiteCRM\Data\ResourceIdentified $resource
     * @param \SuiteCRM\Data\LinkInterface|null $link
     * @param \SuiteCRM\Data\MetaDataInterface|null $meta
     */
    public function __construct(
        ResourceIdentified $resource,
        LinkInterface $link = null,
        MetaDataInterface $meta = null
    ) {
        $this->data = $resource;
        $this->name = $resource->getType();
        $this->links = $link;
        $this->meta = $meta;
    }

    /**
     * @return string
     */
    public function getRelationshipName()
    {
       return $this->name;
    }

    /**
     * @uses DataInterface
     * @returns array
     */
    public function getData()
    {
        $response = array();
        if(!empty($this->data)) {
            $response['data'] = $this->data;
        }

        if(!empty($this->links)) {
            $response['links'] = $this->links;
        }

        if(!empty($this->meta)) {
            $response['meta'] = $this->data;
        }

        return $response;
    }

    /**
     * @param string $id
     * @param \SuiteCRM\Data\ResourceIdentified $resource
     * @return void
     * @throws \SuiteCRM\Data\ResourceException
     */
    public function addResource($id, ResourceIdentified $resource)
    {
        // TODO: Implement addResource() method.
    }

    /**
     * @param string $id
     * @param \SuiteCRM\Data\ResourceIdentified $resource
     * @return void
     * @throws \SuiteCRM\Data\ResourceException
     */
    public function setResource($id, ResourceIdentified $resource)
    {
        // TODO: Implement setResource() method.
    }

    /**
     * @param string $id
     * @return void
     * @throws \SuiteCRM\Data\ResourceException
     */
    public function removeResource($id)
    {
        // TODO: Implement removeResource() method.
    }

    /**
     * @param string $id
     * @return boolean
     */
    public function ResourceExits($id)
    {
        // TODO: Implement ResourceExits() method.
    }

    /**
     * @param string $id
     * @return \SuiteCRM\Data\ResourceIdentified
     * @throws \SuiteCRM\Data\ResourceException
     */
    public function atResource($id)
    {
        // TODO: Implement atResource() method.
    }

    /**
     * @param \SuiteCRM\Data\LinkInterface $link
     */
    public function setLink(LinkInterface $link)
    {
        // TODO: Implement setLink() method.
    }

    /**
     * @param \SuiteCRM\Data\MetaDataInterface $metadata
     */
    public function setMetaData(MetaDataInterface $metadata)
    {
        // TODO: Implement setMetaData() method.
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
