	.syntax unified
	.set sub_8019914, 0x08019914 + 1
	.set sub_801DA28, 0x0801DA28 + 1
	.section .text.sub_8033DAC, "ax", %progbits
@ sub_8033DAC @ JP 0x08033DAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033DAC
	.thumb_func
sub_8033DAC:
	push {lr}
	ldr r0, _08033DC4 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08033DC0
	bl sub_8019914
	movs r0, #0
	bl sub_801DA28
_08033DC0:
	pop {r0}
	bx r0
	.align 2, 0
_08033DC4: .4byte 0x0202BCEC

