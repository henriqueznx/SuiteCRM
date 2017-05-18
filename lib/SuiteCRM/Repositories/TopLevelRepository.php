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

namespace SuiteCRM\Repositories;

use SuiteCRM\Repositories\TopLevelRepositoryInterface as TopLevelRepositoryInterface;
use SuiteCRM\Data\MetaDataInterface as MetaDataInterface;
use SuiteCRM\Repositories\JsonApiInterface as JsonApiInterface;
use SuiteCRM\Data\LinkInterface as LinkInterface;

/**
 * @license AGPL 3
 * @link https://github.com/salesagility/SuiteCRM
 *
 * Base class which implements the data structure specified by json api 1.0:
 * http://jsonapi.org/format/#document-top-level
 *
 * As specified, the errors key cannot co-exist with the data and include keys.
 * TopLevelRepository contains the Repositories with can be co-exist. During the request
 * process the DataRepository will be passed through the process. When an error occurs,
 * the DataRepository will be replaced by an ErrorRepository.
 *
 * This ensures that when an Repository is serialized or encoded into formats such as JSON,
 * only the correct keys will be in the final format. These objects use the
 * repository design pattern to decouple the data from the datasource
 * such as the database, file, email etc...
 *
 * The DataInterface ensures that access to the data is consistent. Each object specified
 * in the specification has an interface.
 */
class TopLevelRepository implements TopLevelRepositoryInterface
{
    /**
     * @var MetaDataInterface $meta
     */
    protected $meta;

    /**
     * @var JsonApiInterface $jsonapi
     */
    protected $jsonapi;
    
    /**
     * @var LinkInterface $links
     */
    protected $links;

    /**
     * @inheritdoc
     */
    public function getData()
    {
        // TODO: Implement get() method.
    }
}
