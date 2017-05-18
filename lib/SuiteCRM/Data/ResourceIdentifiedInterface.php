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

use SuiteCRM\Data\DataInterface as DataInterface;
use SuiteCRM\Utilities\UuidInterface as UuidInterface;

/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 * Links to any data object
 */
interface ResourceIdentifiedInterface extends DataInterface
{
    /**
     * @return UuidInterface
     */
    public function getId();

    /**
     * @param UuidInterface $uuid
     * @return null
     */
    public function setId(UuidInterface $uuid);

    /**
     * @return null
     * @throws ResourceIdentifiedException::invalidType
     * @throws ResourceException::invalidType
     */
    public function getType();

    /**
     * @param string ResourceType
     * @return null
     * @throws ResourceIdentifiedException::invalidType
     * @throws ResourceException::invalidType
     */
    public function setType($type);

    /**
     * @return bool
     * true === Object is a ResourceIdentified which has only has id and type.
     * false === Object is a Resource.
     */
    public function isResourceIdentified();
}

