	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.section .text.sub_805ABBC, "ax", %progbits
@ sub_805ABBC @ JP 0x0805ABBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805ABBC
	.thumb_func
sub_805ABBC:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _0805ACC4 @ =0x080DFF00
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, _0805ACC8 @ =0x080DFF2D
	ldr r1, _0805ACCC @ =0x0203E11C
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, _0805ACD0 @ =0x02000030
	ldr r0, _0805ACD4 @ =0x080DFF38
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, _0805ACD8 @ =0x02000034
	strh r2, [r0]
	ldr r0, _0805ACDC @ =0x02000028
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, _0805ACE0 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, _0805ACE4 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805ACE8 @ =0x0200F1C8
	adds r0, r1, r0
	cmp r5, #0xff
	bne _0805AC24
	ldr r0, _0805ACEC @ =0x085E3F8C
_0805AC24:
	adds r1, r6, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805ACDC @ =0x02000028
	ldr r0, _0805ACF0 @ =0x0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805ACE0 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, _0805ACF4 @ =0x02000088
	str r0, [r3, #0x2c]
	ldr r0, _0805ACF8 @ =0x020041C8
	str r0, [r3, #0x30]
	ldr r0, _0805ACFC @ =0x02000000
	str r3, [r0]
	ldr r0, _0805ACE4 @ =0x0200005C
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805ACE8 @ =0x0200F1C8
	adds r0, r1, r0
	cmp r2, #0xff
	bne _0805AC78
	ldr r0, _0805ACEC @ =0x085E3F8C
_0805AC78:
	mov r1, sb
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805ACDC @ =0x02000028
	ldr r0, _0805ACF0 @ =0x0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805ACE0 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, _0805ACF4 @ =0x02000088
	str r0, [r3, #0x2c]
	ldr r0, _0805ACF8 @ =0x020041C8
	str r0, [r3, #0x30]
	ldr r0, _0805ACFC @ =0x02000000
	str r3, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ACC4: .4byte 0x080DFF00
_0805ACC8: .4byte 0x080DFF2D
_0805ACCC: .4byte 0x0203E11C
_0805ACD0: .4byte 0x02000030
_0805ACD4: .4byte 0x080DFF38
_0805ACD8: .4byte 0x02000034
_0805ACDC: .4byte 0x02000028
_0805ACE0: .4byte 0x0200002C
_0805ACE4: .4byte 0x0200005C
_0805ACE8: .4byte 0x0200F1C8
_0805ACEC: .4byte 0x085E3F8C
_0805ACF0: .4byte 0x0201FB0C
_0805ACF4: .4byte 0x02000088
_0805ACF8: .4byte 0x020041C8
_0805ACFC: .4byte 0x02000000

