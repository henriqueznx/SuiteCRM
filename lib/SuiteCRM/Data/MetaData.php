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

use SuiteCRM\Data\MetaDataInterface as MetaDataInterface;
use SuiteCRM\Data\MetaDataException as MetaDataException;


/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 *
 * MetaData which implements the data structure specified by json api
 * http://jsonapi.org/format/#document-meta
 */
class MetaData implements MetaDataInterface, \ArrayAccess
{
    /**
     * @var array $meta
     */
    protected $meta;

    /**
     * @uses \SuiteCRM\Data\DataInterface
     * @returns array
     */
    public function getData()
    {
        return array(
            'meta' => $this->meta
        );
    }

    /**
     * @param string $key
     * @param array|string|integer|float|bool|null $value
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function addAttribute($key, $value)
    {
        if (gettype($key) !== "string") {
            throw MetaDataException::invalidKey($key);
        }

        if (gettype($value) === "resource") {
            throw MetaDataException::invalidValue($value);
        }

        if (gettype($value) === "object") {
            throw MetaDataException::invalidValue($value);
        }
        $this->meta[$key] = $value;
    }

    /**
     * @param string $key
     * @param array|string|integer|float|bool|null $value
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function setAttribute($key, $value)
    {
        if (gettype($key) !== "string") {
            throw MetaDataException::invalidKey($key);
        }

        if (gettype($value) === "resource") {
            throw MetaDataException::invalidValue($value);
        }

        if (gettype($value) === "object") {
            throw MetaDataException::invalidValue($value);
        }
        $this->meta[$key] = $value;
    }

    /**
     * @param string $key
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function removeAttribute($key)
    {
        if (!isset($this->meta[$key])) {
            throw MetaDataException::keyNotFound($key);
        } else {
            unset($this->meta[$key]);
        }
    }

    /**
     * @param string $key
     * @return boolean
     */
    public function attributeExits($key)
    {
        return isset($this->meta[$key]);
    }

    /**
     * @param string $key
     * @return array|string|integer|float|bool|null
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function atAttribute($key)
    {
        if (!isset($this->meta[$key])) {
            throw MetaDataException::keyNotFound($key);
        }

        return $this->meta[$key];
    }

    /**
     * @uses ArrayAccess
     * @param string $key
     * @return boolean
     */
    public function offsetExists($key)
    {
        return $this->attributeExits($key);
    }

    /**
     * @uses ArrayAccess
     * @param string $key
     * @return array|string|integer|float|bool|null
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function offsetGet($key)
    {
        return $this->atAttribute($key);
    }

    /**
     * @uses ArrayAccess
     * @param string $key
     * @param array|string|integer|float|bool|null $value
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function offsetSet($key, $value)
    {
        $this->setAttribute($key, $value);
    }

    /**
     * @uses ArrayAccess
     * @param string $key
     * @throws \SuiteCRM\Data\MetaDataException
     */
    public function offsetUnset($key)
    {
        $this->removeAttribute($key);
    }
}
