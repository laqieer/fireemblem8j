	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80A6AFC, 0x080A6AFC + 1
	.section .text.sub_80A705C, "ax", %progbits
@ sub_80A705C @ JP 0x080A705C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A705C
	.thumb_func
sub_80A705C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080A7144 @ =0x02014F24
	ldr r0, _080A7148 @ =0x02014EF8
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _080A714C @ =0x02014FD0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_80A6AFC
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_80A6AFC
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_80A6AFC
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_80A6AFC
	bl sub_8000CD8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_80A6AFC
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_80A6AFC
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_80A6AFC
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_80A6AFC
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_80A6AFC
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_80A6AFC
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_80A6AFC
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_80A6AFC
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_80A6AFC
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_80A6AFC
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_80A6AFC
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_80A6AFC
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_80A6AFC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7144: .4byte 0x02014F24
_080A7148: .4byte 0x02014EF8
_080A714C: .4byte 0x02014FD0

