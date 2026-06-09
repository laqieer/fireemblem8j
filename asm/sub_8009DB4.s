	.syntax unified
	.set SetFlag, 0x080860A8 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_800D340, 0x0800D340 + 1
	.section .text.sub_8009DB4, "ax", %progbits
@ sub_8009DB4 @ JP 0x08009DB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009DB4
	.thumb_func
sub_8009DB4:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	ldr r0, _08009DCC @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08009DD0
	cmp r0, #3
	beq _08009DE0
	b _08009DE8
	.align 2, 0
_08009DCC: .4byte 0x0202BCEC
_08009DD0:
	ldr r0, _08009DDC @ =0x08A72414
	movs r1, #1
	bl sub_800D340
	b _08009DE8
	.align 2, 0
_08009DDC: .4byte 0x08A72414
_08009DE0:
	ldr r0, _08009DF4 @ =0x08A7241C
	movs r1, #1
	bl sub_800D340
_08009DE8:
	movs r0, #0x84
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_08009DF4: .4byte 0x08A7241C

