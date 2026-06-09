	.syntax unified
	.set sub_80A6B90, 0x080A6B90 + 1
	.section .text.sub_80A7150, "ax", %progbits
@ sub_80A7150 @ JP 0x080A7150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7150
	.thumb_func
sub_80A7150:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _080A7230 @ =0x02014F24
	ldr r0, _080A7234 @ =0x02014EF8
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_80A6B90
	ldr r5, _080A7238 @ =0x02014FD0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_80A6B90
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_80A6B90
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_80A6B90
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_80A6B90
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_80A6B90
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_80A6B90
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_80A6B90
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_80A6B90
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_80A6B90
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_80A6B90
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_80A6B90
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_80A6B90
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_80A6B90
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_80A6B90
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_80A6B90
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_80A6B90
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7230: .4byte 0x02014F24
_080A7234: .4byte 0x02014EF8
_080A7238: .4byte 0x02014FD0

