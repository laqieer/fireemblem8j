	.syntax unified
	.set WriteSuspendSave, 0x080AA460 + 1
	.section .text.sub_8015518, "ax", %progbits
@ sub_8015518 @ JP 0x08015518 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015518
	.thumb_func
sub_8015518:
	push {lr}
	ldr r1, _0801552C @ =0x0203A954
	movs r0, #9
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_0801552C: .4byte 0x0203A954

