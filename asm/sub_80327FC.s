	.syntax unified
	.set GetCurrentBgmSong, 0x080021A8 + 1
	.set StartBgmExt, 0x08002434 + 1
	.set sub_8015FD4, 0x08015FD4 + 1
	.section .text.sub_80327FC, "ax", %progbits
@ sub_80327FC @ JP 0x080327FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80327FC
	.thumb_func
sub_80327FC:
	push {r4, lr}
	bl sub_8015FD4
	adds r4, r0, #0
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _08032816
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl StartBgmExt
_08032816:
	pop {r4}
	pop {r0}
	bx r0

