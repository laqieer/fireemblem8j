	.syntax unified
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001208, 0x08001208 + 1
	.section .text.sub_808FF5C, "ax", %progbits
@ sub_808FF5C @ JP 0x0808FF5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FF5C
	.thumb_func
sub_808FF5C:
	push {lr}
	ldr r1, _0808FF84 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0808FF88 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808FF8C @ =OnVBlank_SioError
	bl sub_8001208
	ldr r0, _0808FF90 @ =sub_808FEB0
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_0808FF84: .4byte 0x04000004
_0808FF88: .4byte 0x04000208
_0808FF8C: .4byte 0x0808FDCD  @ OnVBlank_SioError
_0808FF90: .4byte 0x0808FEB1  @ sub_808FEB0

