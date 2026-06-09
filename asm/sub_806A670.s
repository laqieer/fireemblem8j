	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806A41C, 0x0806A41C + 1
	.section .text.sub_806A670, "ax", %progbits
@ sub_806A670 @ JP 0x0806A670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A670
	.thumb_func
sub_806A670:
	push {lr}
	sub sp, #8
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0806A696
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	movs r2, #0
	bl sub_806A41C
	b _0806A932
_0806A696:
	cmp r0, #5
	bne _0806A6A8
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A6A8:
	cmp r0, #7
	bne _0806A6B8
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	b _0806A8BE
_0806A6B8:
	cmp r0, #9
	bne _0806A6CA
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A6CA:
	cmp r0, #0xb
	bne _0806A6DC
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A6DC:
	cmp r0, #0xd
	bne _0806A6EE
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	str r3, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A6EE:
	cmp r0, #0xf
	bne _0806A700
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A700:
	cmp r0, #0x11
	bne _0806A712
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	b _0806A8BE
_0806A712:
	cmp r0, #0x13
	bne _0806A726
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A726:
	cmp r0, #0x15
	bne _0806A73A
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b _0806A8BE
_0806A73A:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	ldrh r1, [r2, #0x2c]
	cmp r0, #0x17
	bne _0806A74C
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b _0806A784
_0806A74C:
	cmp r0, #0x19
	bne _0806A75A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b _0806A784
_0806A75A:
	cmp r0, #0x1b
	bne _0806A76A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b _0806A788
_0806A76A:
	cmp r0, #0x1d
	bne _0806A778
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b _0806A784
_0806A778:
	cmp r0, #0x1f
	bne _0806A792
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
_0806A784:
	str r1, [sp, #4]
	movs r1, #2
_0806A788:
	movs r2, #8
	movs r3, #8
	bl sub_806A41C
	b _0806A932
_0806A792:
	cmp r0, #0x21
	bne _0806A7A8
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	b _0806A802
_0806A7A8:
	cmp r0, #0x23
	bne _0806A7BC
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #1
	str r1, [sp]
	b _0806A802
_0806A7BC:
	cmp r0, #0x25
	bne _0806A7D8
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	bl sub_806A41C
	b _0806A932
_0806A7D8:
	cmp r0, #0x27
	bne _0806A7EE
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	b _0806A802
_0806A7EE:
	cmp r0, #0x29
	bne _0806A80C
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #4
_0806A802:
	str r1, [sp, #4]
	movs r1, #2
	bl sub_806A41C
	b _0806A932
_0806A80C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2b
	bne _0806A81C
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b _0806A854
_0806A81C:
	cmp r0, #0x2d
	bne _0806A82A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b _0806A854
_0806A82A:
	cmp r0, #0x2f
	bne _0806A83A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b _0806A858
_0806A83A:
	cmp r0, #0x31
	bne _0806A848
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b _0806A854
_0806A848:
	cmp r0, #0x33
	bne _0806A862
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
_0806A854:
	str r1, [sp, #4]
	movs r1, #2
_0806A858:
	movs r2, #0x12
	movs r3, #0x12
	bl sub_806A41C
	b _0806A932
_0806A862:
	cmp r0, #0x35
	bne _0806A874
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	b _0806A8BA
_0806A874:
	cmp r0, #0x37
	bne _0806A884
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #1
	str r1, [sp]
	b _0806A8BA
_0806A884:
	cmp r0, #0x39
	bne _0806A898
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b _0806A8BE
_0806A898:
	cmp r0, #0x3b
	bne _0806A8AA
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	b _0806A8BA
_0806A8AA:
	cmp r0, #0x3d
	bne _0806A8C6
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #4
_0806A8BA:
	str r1, [sp, #4]
	movs r1, #2
_0806A8BE:
	movs r3, #0
	bl sub_806A41C
	b _0806A932
_0806A8C6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x3f
	bne _0806A8D6
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b _0806A90E
_0806A8D6:
	cmp r1, #0x41
	bne _0806A8E4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b _0806A90E
_0806A8E4:
	cmp r1, #0x43
	bne _0806A8F4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b _0806A912
_0806A8F4:
	cmp r1, #0x45
	bne _0806A902
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b _0806A90E
_0806A902:
	cmp r1, #0x47
	bne _0806A91C
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
_0806A90E:
	str r1, [sp, #4]
	movs r1, #2
_0806A912:
	movs r2, #0xc
	movs r3, #0xc
	bl sub_806A41C
	b _0806A932
_0806A91C:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0806A932
	ldr r1, _0806A938 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl sub_8002DE4
_0806A932:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0806A938: .4byte 0x0201774C

