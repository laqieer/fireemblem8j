	.syntax unified
	.section .text.sub_808DEBC, "ax", %progbits
@ sub_808DEBC @ JP 0x0808DEBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DEBC
	.thumb_func
sub_808DEBC:
	push {lr}
	cmp r0, #0
	bge _0808DECE
	cmp r1, #0
	bge _0808DECA
	movs r0, #0
	b _0808DED8
_0808DECA:
	movs r0, #1
	b _0808DED8
_0808DECE:
	cmp r1, #0
	blt _0808DED6
	movs r0, #3
	b _0808DED8
_0808DED6:
	movs r0, #2
_0808DED8:
	pop {r1}
	bx r1

