	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80ACEF0, "ax", %progbits
@ sub_80ACEF0 @ JP 0x080ACEF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACEF0
	.thumb_func
sub_80ACEF0:
	push {lr}
	sub sp, #0x20
	ldr r1, _080ACF2C @ =0x081F579F
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl sub_8000CD8
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r3, r0, #0
	adds r3, #0x10
	ldr r2, _080ACF30 @ =0x020228A8
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_8001EE4
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080ACF2C: .4byte 0x081F579F
_080ACF30: .4byte 0x020228A8

