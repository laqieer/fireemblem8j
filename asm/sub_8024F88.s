	.syntax unified
	.set InitTargets, 0x08050618 + 1
	.set sub_8024EC8, 0x08024EC8 + 1
	.section .text.sub_8024F88, "ax", %progbits
@ sub_8024F88 @ JP 0x08024F88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024F88
	.thumb_func
sub_8024F88:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	bl InitTargets
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _08024FE4 @ =0x03004940
	mov ip, r1
	lsls r6, r5, #2
	movs r7, #0x80
	lsls r7, r7, #0x11
_08024FA6:
	adds r3, r0, #1
	movs r2, #0
_08024FAA:
	cmp r4, #0
	blt _08024FC2
	cmp r5, #0
	blt _08024FC2
	mov r1, ip
	ldr r0, [r1]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08024FC2:
	adds r0, r2, #0
	adds r2, r2, r7
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _08024FAA
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _08024FA6
	mov r0, r8
	bl sub_8024EC8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024FE4: .4byte 0x03004940

