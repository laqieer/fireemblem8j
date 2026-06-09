	.syntax unified
	.section .text.sub_8032A54, "ax", %progbits
@ sub_8032A54 @ JP 0x08032A54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032A54
	.thumb_func
sub_8032A54:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	movs r2, #0
	ldr r0, _08032A9C @ =0x085C6080
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	bgt _08032AAE
	adds r5, r3, #0
	adds r5, #0x41
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r4, r0, #0
_08032A7C:
	adds r0, r3, #0
	adds r0, #0x2d
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r7
	bne _08032AA0
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	bne _08032AA0
	adds r0, r2, #0
	b _08032AB2
	.align 2, 0
_08032A9C: .4byte 0x085C6080
_08032AA0:
	adds r0, r1, #0
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	asrs r2, r0, #0x18
	cmp r2, r4
	ble _08032A7C
_08032AAE:
	movs r0, #1
	rsbs r0, r0, #0
_08032AB2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

