	.syntax unified
	.set ForceScreenToBlack, 0x08014268 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_800D340, 0x0800D340 + 1
	.set sub_8030D50, 0x08030D50 + 1
	.section .text.sub_8009DF8, "ax", %progbits
@ sub_8009DF8 @ JP 0x08009DF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009DF8
	.thumb_func
sub_8009DF8:
	push {lr}
	bl sub_8030D50
	bl ForceScreenToBlack
	ldr r0, _08009E10 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08009E14
	cmp r0, #3
	beq _08009E24
	b _08009E2C
	.align 2, 0
_08009E10: .4byte 0x0202BCEC
_08009E14:
	ldr r0, _08009E20 @ =0x08A72434
	movs r1, #1
	bl sub_800D340
	b _08009E2C
	.align 2, 0
_08009E20: .4byte 0x08A72434
_08009E24:
	ldr r0, _08009E38 @ =0x08A72544
	movs r1, #1
	bl sub_800D340
_08009E2C:
	movs r0, #0x84
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_08009E38: .4byte 0x08A72544

