	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8071C18, "ax", %progbits
@ sub_8071C18 @ JP 0x08071C18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071C18
	.thumb_func
sub_8071C18:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08071C58 @ =0x08C00008
	movs r1, #0xc4
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r0, [r0, #0x1c]
	ldr r5, _08071C5C @ =0x0201C790
	adds r1, r5, #0
	bl sub_80D6394
	adds r5, #0x20
	ldr r4, _08071C60 @ =0x02022AE8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r4, #0x20
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	adds r0, r6, #0
	bl sub_8002DE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071C58: .4byte 0x08C00008
_08071C5C: .4byte 0x0201C790
_08071C60: .4byte 0x02022AE8

