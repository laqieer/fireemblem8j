	.syntax unified
	.set HideGmUnit, 0x080C4354 + 1
	.set sub_80C8130, 0x080C8130 + 1
	.section .text.sub_800CA34, "ax", %progbits
@ sub_800CA34 @ JP 0x0800CA34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CA34
	.thumb_func
sub_800CA34:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, [r0, #0x38]
	movs r3, #4
	ldrsh r2, [r1, r3]
	ldrh r3, [r1, #6]
	movs r4, #8
	ldrsh r5, [r1, r4]
	movs r6, #0xa
	ldrsh r4, [r1, r6]
	ldrh r6, [r1, #0xc]
	ldrh r7, [r1, #0xe]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800CA74
	ldr r0, _0800CA70 @ =0x03005270
	lsls r1, r2, #2
	adds r1, r1, r0
	strb r4, [r1, #0x11]
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _0800CA8A
	adds r0, r2, #0
	bl HideGmUnit
	b _0800CA8A
	.align 2, 0
_0800CA70: .4byte 0x03005270
_0800CA74:
	mov r0, sp
	strb r2, [r0]
	strb r1, [r0, #1]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	str r6, [sp, #0xc]
	strh r7, [r0, #0xa]
	adds r1, r3, #0
	movs r2, #0
	bl sub_80C8130
_0800CA8A:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

