package org.nhnnext.repository;

import org.nhnnext.web.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long>{
	 User findByStrId(String strId);
}
