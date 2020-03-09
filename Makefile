test:
	test -d ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6 && mv ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6 ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6.bak; true
	cp -R . ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6
	go test -coverprofile=cover.out -race gopkg.in/rethinkdb/rethinkdb-go.v6; true
	go tool cover -html=cover.out -o cover.html; true
	rm -f cover.out; true
	rm -rf ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6
	test -d ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6.bak && mv ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6.bak ${GOPATH}/src/gopkg.in/rethinkdb/rethinkdb-go.v6; true

benchpool:
    go test -v -cpu 1,2,4,8,16,24,32,64,128,256 -bench=BenchmarkConnectionPool -run ^$ ./internal/integration/tests/