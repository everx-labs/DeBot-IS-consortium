#pragma once

namespace tvm { namespace schema {

__interface IIOText {
	[[internal, answer_id]]
	bytes input(string prompt);
	[[internal, answer_id]]
	bool_t output(bytes text);
	[[internal, answer_id]]
}

}
};

