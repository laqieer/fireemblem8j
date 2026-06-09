	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80045BC, 0x080045BC + 1
	.section .text.sub_8091590, "ax", %progbits
@ sub_8091590 @ JP 0x08091590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091590
	.thumb_func
sub_8091590:
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
	blt _080915D4
_080915AE:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl sub_80045BC
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
	ble _080915AE
_080915D4:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

