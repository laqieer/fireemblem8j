	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8031438, 0x08031438 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804490C, 0x0804490C + 1
	.section .text.sub_8044AC8, "ax", %progbits
@ sub_8044AC8 @ JP 0x08044AC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044AC8
	.thumb_func
sub_8044AC8:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044B06
	movs r0, #2
	bl sub_8043190
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044AF8
	ldr r0, _08044AF4 @ =0x0203DA20
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl sub_804490C
	b _08044AFE
	.align 2, 0
_08044AF4: .4byte 0x0203DA20
_08044AF8:
	adds r0, r4, #0
	bl sub_8031438
_08044AFE:
	adds r0, r5, #0
	bl sub_8002DE4
	b _08044B0C
_08044B06:
	movs r0, #0
	bl sub_8043190
_08044B0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

