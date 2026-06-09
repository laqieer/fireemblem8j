	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_809C84C, 0x0809C84C + 1
	.section .text.sub_809D5EC, "ax", %progbits
@ sub_809D5EC @ JP 0x0809D5EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D5EC
	.thumb_func
sub_809D5EC:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809D604
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl sub_809C84C
_0809D604:
	ldrh r1, [r4, #0x34]
	subs r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _0809D61C
	adds r0, r4, #0
	bl sub_8002DE4
_0809D61C:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

