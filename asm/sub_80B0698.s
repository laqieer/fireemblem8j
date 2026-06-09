	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.section .text.sub_80B0698, "ax", %progbits
@ sub_80B0698 @ JP 0x080B0698 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0698
	.thumb_func
sub_80B0698:
	push {lr}
	ldr r0, _080B06AC @ =0x02023CA8
	ldr r1, _080B06B0 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	pop {r0}
	bx r0
	.align 2, 0
_080B06AC: .4byte 0x02023CA8
_080B06B0: .4byte 0x06007000

