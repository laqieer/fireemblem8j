	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80ACF34, "ax", %progbits
@ sub_80ACF34 @ JP 0x080ACF34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACF34
	.thumb_func
sub_80ACF34:
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080ACF78 @ =0x081F57C0
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080ACF7C @ =0x0202BCAC
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080ACF50
	adds r1, #3
_080ACF50:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080ACF60
	adds r0, #3
_080ACF60:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACF78: .4byte 0x081F57C0
_080ACF7C: .4byte 0x0202BCAC

