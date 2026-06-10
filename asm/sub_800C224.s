	.syntax unified
	.set sub_80C41F0, 0x080C41F0 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_800C224, "ax", %progbits
@ sub_800C224 @ JP 0x0800C224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C224
	.thumb_func
sub_800C224:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	movs r2, #4
	ldrsh r1, [r0, r2]
	mov sb, r1
	movs r2, #6
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldrh r1, [r0, #8]
	movs r2, #0xa
	ldrsh r7, [r0, r2]
	movs r2, #0xc
	ldrsh r6, [r0, r2]
	lsls r1, r1, #5
	ldr r0, _0800C288 @ =0x081F5D7C
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
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
	bne _0800C276
	cmp r7, #0
	bne _0800C290
	cmp r6, #0
	bne _0800C290
_0800C276:
	ldr r1, _0800C28C @ =0x03005270
	add r0, sp, #8
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldrh r0, [r4]
	strh r0, [r1, #4]
	movs r0, #0
	b _0800C2A8
	.align 2, 0
_0800C288: .4byte 0x081F5D7C
_0800C28C: .4byte 0x03005270
_0800C290:
	add r0, sp, #8
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, sb
	mov r1, r8
	bl sub_80C41F0
	movs r0, #2
_0800C2A8:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

