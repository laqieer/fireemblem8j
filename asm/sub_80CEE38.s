	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CC178, 0x080CC178 + 1
	.section .text.sub_80CEE38, "ax", %progbits
@ sub_80CEE38 @ JP 0x080CEE38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CEE38
	.thumb_func
sub_80CEE38:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80CC178
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080CEEA4
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	ldr r2, _080CEEA0 @ =0x03003020
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CEEA4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CEEAA
	.align 2, 0
_080CEEA0: .4byte 0x03003020
_080CEEA4:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CEEAA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

