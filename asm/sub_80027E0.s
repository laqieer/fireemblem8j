	.syntax unified
	.set MPlayStart, 0x080D5628 + 1
	.set UnlockSoundRoomSong, 0x080A894C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_800284C, 0x0800284C + 1
	.section .text.sub_80027E0, "ax", %progbits
@ sub_80027E0 @ JP 0x080027E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80027E0
	.thumb_func
sub_80027E0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0x7f
	bgt _080027F6
	bl sub_800284C
	movs r0, #0
	adds r1, r4, #0
	bl UnlockSoundRoomSong
_080027F6:
	cmp r5, #0
	beq _08002810
	ldr r0, _0800280C @ =0x08214120
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl MPlayStart
	b _08002818
	.align 2, 0
_0800280C: .4byte 0x08214120
_08002810:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08002818:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

