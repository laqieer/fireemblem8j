	.syntax unified
	.set StartArenaDialogue, 0x080BA788 + 1
	.set sub_8008914, 0x08008914 + 1
	.set sub_8031E18, 0x08031E18 + 1
	.section .text.sub_80BA550, "ax", %progbits
@ sub_80BA550 @ JP 0x080BA550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA550
	.thumb_func
sub_80BA550:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8031E18
	bl sub_8008914
	ldr r0, _080BA56C @ =0x00000872
	adds r1, r4, #0
	bl StartArenaDialogue
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA56C: .4byte 0x00000872

