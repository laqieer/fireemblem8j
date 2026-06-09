	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805C1F8, "ax", %progbits
@ sub_805C1F8 @ JP 0x0805C1F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C1F8
	.thumb_func
sub_805C1F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, _0805C278 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r4, _0805C27C @ =0x0201FDC4
	cmp r0, #0
	bne _0805C210
	ldr r4, _0805C280 @ =0x0201FF04
_0805C210:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, _0805C284 @ =0x087A8CD0
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, _0805C288 @ =0x03003020
	mov sb, r0
_0805C230:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	mov r6, sb
	ldrh r6, [r6, #0x20]
	adds r0, r0, r6
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls _0805C230
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _0805C26A
	adds r0, r2, #0
	bl Proc_End
_0805C26A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C278: .4byte 0x0201FDB8
_0805C27C: .4byte 0x0201FDC4
_0805C280: .4byte 0x0201FF04
_0805C284: .4byte 0x087A8CD0
_0805C288: .4byte 0x03003020

