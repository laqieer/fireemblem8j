	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8035C0C, "ax", %progbits
@ sub_8035C0C @ JP 0x08035C0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035C0C
	.thumb_func
sub_8035C0C:
	push {r4, lr}
	ldr r1, _08035C3C @ =0x0202BCAC
	ldr r0, _08035C40 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r4, [r1, #0xc]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_8000CD8
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035C3C: .4byte 0x0202BCAC
_08035C40: .4byte 0x03004DF0

