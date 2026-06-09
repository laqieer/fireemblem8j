	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_807E098, 0x0807E098 + 1
	.section .text.sub_807DFF0, "ax", %progbits
@ sub_807DFF0 @ JP 0x0807DFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DFF0
	.thumb_func
sub_807DFF0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r7, #0
	ldr r0, _0807E090 @ =0x0203E1EC
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r2, r0
	bge _0807E070
	movs r6, #0
	ldr r0, _0807E094 @ =0x0202BD2D
	mov sb, r0
_0807E010:
	ldr r0, _0807E090 @ =0x0203E1EC
	adds r0, r6, r0
	ldrh r4, [r0, #0xe]
	ldrb r0, [r0, #0xd]
	lsls r1, r0, #4
	cmp r4, r1
	ble _0807E026
	adds r0, r4, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807E026:
	cmp r4, r1
	bge _0807E04C
	adds r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	bne _0807E04C
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E04C
	movs r0, #0x75
	str r2, [sp]
	bl m4aSongNumStart
	ldr r2, [sp]
_0807E04C:
	ldr r5, _0807E090 @ =0x0203E1EC
	adds r0, r6, r5
	ldrh r1, [r0, #0xe]
	cmp r4, r1
	beq _0807E062
	strh r4, [r0, #0xe]
	mov r0, r8
	adds r1, r7, #0
	bl sub_807E098
	movs r2, #1
_0807E062:
	adds r6, #0x14
	adds r7, #1
	adds r0, r5, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r7, r0
	blt _0807E010
_0807E070:
	cmp r2, #0
	bne _0807E082
	ldr r0, _0807E090 @ =0x0203E1EC
	adds r1, r0, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807E082
	strb r2, [r1]
_0807E082:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E090: .4byte 0x0203E1EC
_0807E094: .4byte 0x0202BD2D

