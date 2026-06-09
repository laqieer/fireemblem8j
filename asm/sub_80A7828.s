	.syntax unified
	.set CopyString, 0x08012F78 + 1
	.set sub_80A7704, 0x080A7704 + 1
	.set sub_80A77EC, 0x080A77EC + 1
	.section .text.sub_80A7828, "ax", %progbits
@ sub_80A7828 @ JP 0x080A7828 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7828
	.thumb_func
sub_80A7828:
	push {r4, r5, lr}
	sub sp, #0x64
	bl sub_80A7704
	ldr r1, _080A78E0 @ =0x081F56A4
	mov r0, sp
	bl CopyString
	ldr r0, _080A78E4 @ =0x00040624
	str r0, [sp, #8]
	mov r1, sp
	movs r4, #0
	movs r5, #0
	ldr r0, _080A78E8 @ =0x0000200A
	strh r0, [r1, #0xc]
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #0xe]
	ldrb r0, [r1, #0xf]
	ands r3, r0
	strb r3, [r1, #0xf]
	mov r0, sp
	strb r4, [r0, #0xf]
	strh r5, [r0, #0x10]
	strh r5, [r0, #0x12]
	adds r0, #0x63
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	add r3, sp, #0x20
	add r4, sp, #0x40
	add r1, sp, #0x14
	movs r2, #0
	subs r0, #0x43
_080A78AA:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A78AA
	adds r1, r3, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_080A78BA:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A78BA
	adds r1, r4, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_080A78CA:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A78CA
	mov r0, sp
	bl sub_80A77EC
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A78E0: .4byte 0x081F56A4
_080A78E4: .4byte 0x00040624
_080A78E8: .4byte 0x0000200A

