	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A7A68, "ax", %progbits
@ sub_80A7A68 @ JP 0x080A7A68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7A68
	.thumb_func
sub_80A7A68:
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r4, #6
	bgt _080A7A94
	add r0, sp, #0x10
	ldr r2, _080A7A9C @ =0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _080A7AA0 @ =0x01000008
	mov r1, sp
	bl sub_80D6370
	ldr r1, _080A7AA4 @ =0x08A9CA20
	lsls r0, r4, #4
	adds r0, #0x64
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x10
	bl WriteAndVerifySramFast
_080A7A94:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A9C: .4byte 0x0000FFFF
_080A7AA0: .4byte 0x01000008
_080A7AA4: .4byte 0x08A9CA20

