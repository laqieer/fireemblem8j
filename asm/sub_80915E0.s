	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.section .text.sub_80915E0, "ax", %progbits
@ sub_80915E0 @ JP 0x080915E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80915E0
	.thumb_func
sub_80915E0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _08091624
_080915FE:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl sub_8003D84
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _080915FE
_08091624:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

