	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8021C28, "ax", %progbits
@ sub_8021C28 @ JP 0x08021C28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021C28
	.thumb_func
sub_8021C28:
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08021C68 @ =0x085C3978
	movs r1, #3
	bl sub_8002BCC
	lsls r0, r4, #4
	ldr r2, _08021C6C @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021C68: .4byte 0x085C3978
_08021C6C: .4byte 0x0202BCAC

