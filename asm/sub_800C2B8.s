	.syntax unified
	.set sub_80C41F0, 0x080C41F0 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_800C2B8, "ax", %progbits
@ Event88_WmScrollCameraOntoUnit @ JP 0x0800C2B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event88_WmScrollCameraOntoUnit
	.thumb_func
Event88_WmScrollCameraOntoUnit:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	movs r2, #4
	ldrsh r1, [r0, r2]
	mov sl, r1
	movs r1, #6
	ldrsh r3, [r0, r1]
	mov sb, r3
	ldrh r1, [r0, #8]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	mov r8, r2
	movs r2, #0xc
	ldrsh r7, [r0, r2]
	ldr r6, _0800C328 @ =0x03005270
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r0, _0800C32C @ =0x081F5D7C
	adds r1, r1, r0
	movs r3, #0x18
	ldrsh r0, [r1, r3]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r4, sp
	adds r4, #0xa
	add r2, sp, #8
	adds r3, r4, #0
	bl sub_80C5628
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C318
	mov r3, r8
	cmp r3, #0
	bne _0800C330
	cmp r7, #0
	bne _0800C330
_0800C318:
	add r0, sp, #8
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldrh r0, [r4]
	strh r0, [r6, #4]
	movs r0, #0
	b _0800C34A
	.align 2, 0
_0800C328: .4byte 0x03005270
_0800C32C: .4byte 0x081F5D7C
_0800C330:
	add r0, sp, #8
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldrsh r3, [r4, r0]
	mov r1, r8
	str r1, [sp]
	str r7, [sp, #4]
	mov r0, sl
	mov r1, sb
	bl sub_80C41F0
	movs r0, #2
_0800C34A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

