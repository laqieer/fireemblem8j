	.syntax unified
	.set GetOverallRank, 0x080BABF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80BA8F8, 0x080BA8F8 + 1
	.set sub_80BA9F0, 0x080BA9F0 + 1
	.set sub_80BAA28, 0x080BAA28 + 1
	.set sub_80BAB20, 0x080BAB20 + 1
	.set sub_80BAB54, 0x080BAB54 + 1
	.section .text.sub_80A3074, "ax", %progbits
@ sub_80A3074 @ JP 0x080A3074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3074
	.thumb_func
sub_80A3074:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_80BA8F8
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl sub_80BA9F0
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl sub_80BAB54
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl sub_80BAA28
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl sub_80BAB20
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _080A3108 @ =0x08A9A39C
	ldr r1, _080A310C @ =0x06017000
	bl sub_8013008
	ldr r0, _080A3110 @ =0x08A9A4E4
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080A3114 @ =sub_80A2E64
	adds r1, r7, #0
	bl sub_80B1D98
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3108: .4byte 0x08A9A39C
_080A310C: .4byte 0x06017000
_080A3110: .4byte 0x08A9A4E4
_080A3114: .4byte 0x080A2E65  @ sub_80A2E64

