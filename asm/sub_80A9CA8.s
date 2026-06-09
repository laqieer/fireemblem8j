	.syntax unified
	.set CheckPermanentFlagFrom, 0x0808605C + 1
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80A7C04, 0x080A7C04 + 1
	.section .text.sub_80A9CA8, "ax", %progbits
@ sub_80A9CA8 @ JP 0x080A9CA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9CA8
	.thumb_func
sub_80A9CA8:
	push {r4, lr}
	bl GetSaveReadAddr
	ldr r1, _080A9CCC @ =0x00000D6C
	adds r0, r0, r1
	ldr r4, _080A9CD0 @ =0x02020188
	adds r1, r4, #0
	bl sub_80A7C04
	movs r0, #0x8a
	adds r1, r4, #0
	bl CheckPermanentFlagFrom
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9CCC: .4byte 0x00000D6C
_080A9CD0: .4byte 0x02020188

