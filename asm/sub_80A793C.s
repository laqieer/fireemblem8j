	.syntax unified
	.set sub_80AAE48, 0x080AAE48 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A793C, "ax", %progbits
@ sub_80A793C @ JP 0x080A793C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A793C
	.thumb_func
sub_80A793C:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A794A
	mov r4, sp
_080A794A:
	ldr r2, _080A7978 @ =0x03006790
	ldr r0, _080A797C @ =0x08A9CA20
	lsls r1, r5, #4
	adds r1, #0x64
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80D65C8
	ldrh r1, [r4, #4]
	ldr r0, _080A7980 @ =0x0000200A
	cmp r1, r0
	bne _080A79CC
	cmp r5, #6
	bhi _080A79CC
	lsls r0, r5, #2
	ldr r1, _080A7984 @ =_080A7988
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A7978: .4byte 0x03006790
_080A797C: .4byte 0x08A9CA20
_080A7980: .4byte 0x0000200A
_080A7984: .4byte _080A7988
_080A7988: @ jump table
	.4byte _080A79A4 @ case 0
	.4byte _080A79A4 @ case 1
	.4byte _080A79A4 @ case 2
	.4byte _080A79A4 @ case 3
	.4byte _080A79A4 @ case 4
	.4byte _080A79AC @ case 5
	.4byte _080A79B4 @ case 6
_080A79A4:
	ldr r1, _080A79A8 @ =0x00040624
	b _080A79B6
	.align 2, 0
_080A79A8: .4byte 0x00040624
_080A79AC:
	ldr r1, _080A79B0 @ =0x00020112
	b _080A79B6
	.align 2, 0
_080A79B0: .4byte 0x00020112
_080A79B4:
	ldr r1, _080A79C8 @ =0x00020223
_080A79B6:
	ldr r0, [r4]
	cmp r0, r1
	bne _080A79CC
	adds r0, r4, #0
	bl sub_80AAE48
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A79CE
	.align 2, 0
_080A79C8: .4byte 0x00020223
_080A79CC:
	movs r0, #0
_080A79CE:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

