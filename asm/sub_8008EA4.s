	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8008EA4, "ax", %progbits
@ sub_8008EA4 @ JP 0x08008EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008EA4
	.thumb_func
sub_8008EA4:
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b _08008F00
_08008EAE:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
_08008EB8:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, _08008EE8 @ =0x000002FF
	cmp r2, r0
	bgt _08008EEC
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b _08008EEE
	.align 2, 0
_08008EE8: .4byte 0x000002FF
_08008EEC:
	ldr r0, [r3, #0x58]
_08008EEE:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _08008EB8
	adds r1, r5, #0
_08008F00:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt _08008EAE
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08008F20
	adds r0, r3, #0
	bl sub_8002DE4
_08008F20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

