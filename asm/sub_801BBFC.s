	.syntax unified
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.set RegisterCompletedPlaythrough, 0x080A9614 + 1
	.set sub_801BB98, 0x0801BB98 + 1
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A77EC, 0x080A77EC + 1
	.section .text.sub_801BBFC, "ax", %progbits
@ sub_801BBFC @ JP 0x0801BBFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BBFC
	.thumb_func
sub_801BBFC:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, _0801BC7C @ =0x085775CC
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0801BC98
	bl GetGlobalCompletionCount
	adds r5, r0, #0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801BC2A
	cmp r5, #0
	blt _0801BC2A
	subs r5, #1
_0801BC2A:
	ldr r0, _0801BC7C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801BC3E
	cmp r5, #0xb
	bgt _0801BC3E
	adds r5, #1
_0801BC3E:
	mov r0, sp
	bl sub_80A776C
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0801BC4C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0801BC4C
	movs r4, #0
	cmp r4, r5
	bge _0801BC68
_0801BC5A:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl RegisterCompletedPlaythrough
	cmp r4, r5
	blt _0801BC5A
_0801BC68:
	cmp r5, #0
	bne _0801BC80
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	b _0801BC8A
	.align 2, 0
_0801BC7C: .4byte 0x085775CC
_0801BC80:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xe]
_0801BC8A:
	mov r0, sp
	bl sub_80A77EC
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_801BB98
_0801BC98:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

