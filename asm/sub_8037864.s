	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8037720, 0x08037720 + 1
	.section .text.sub_8037864, "ax", %progbits
@ sub_8037864 @ JP 0x08037864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037864
	.thumb_func
sub_8037864:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037884 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl sub_8037720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037884: .4byte 0x0203A954

