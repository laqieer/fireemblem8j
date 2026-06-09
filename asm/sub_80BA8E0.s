	.syntax unified
	.set WriteSuspendSave, 0x080AA460 + 1
	.section .text.sub_80BA8E0, "ax", %progbits
@ sub_80BA8E0 @ JP 0x080BA8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA8E0
	.thumb_func
sub_80BA8E0:
	push {lr}
	ldr r1, _080BA8F4 @ =0x0203A954
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_080BA8F4: .4byte 0x0203A954

