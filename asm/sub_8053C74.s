	.syntax unified
	.set CheckEkrWindowAppearUnexist, 0x08057CFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053C74, "ax", %progbits
@ sub_8053C74 @ JP 0x08053C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053C74
	.thumb_func
sub_8053C74:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08053C90
	ldr r1, _08053C98 @ =0x02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08053C90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053C98: .4byte 0x02017738

