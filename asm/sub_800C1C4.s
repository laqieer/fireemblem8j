	.syntax unified
	.set sub_80C41F0, 0x080C41F0 + 1
	.section .text.sub_800C1C4, "ax", %progbits
@ sub_800C1C4 @ JP 0x0800C1C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C1C4
	.thumb_func
sub_800C1C4:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, [r0, #0x38]
	movs r3, #4
	ldrsh r2, [r1, r3]
	mov ip, r2
	movs r7, #6
	ldrsh r6, [r1, r7]
	movs r2, #8
	ldrsh r4, [r1, r2]
	movs r3, #0xa
	ldrsh r5, [r1, r3]
	movs r7, #0xc
	ldrsh r3, [r1, r7]
	movs r7, #0xe
	ldrsh r2, [r1, r7]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C1F8
	cmp r3, #0
	bne _0800C208
	cmp r2, #0
	bne _0800C208
_0800C1F8:
	ldr r0, _0800C204 @ =0x03005270
	strh r4, [r0, #2]
	strh r5, [r0, #4]
	movs r0, #0
	b _0800C21A
	.align 2, 0
_0800C204: .4byte 0x03005270
_0800C208:
	str r3, [sp]
	str r2, [sp, #4]
	mov r0, ip
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80C41F0
	movs r0, #2
_0800C21A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

