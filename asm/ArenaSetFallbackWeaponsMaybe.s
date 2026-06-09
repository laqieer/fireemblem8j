	.syntax unified
	.set sub_8031EC0, 0x08031EC0 + 1
	.section .text.ArenaSetFallbackWeaponsMaybe, "ax", %progbits
@ ArenaSetFallbackWeaponsMaybe @ JP 0x08031F14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ArenaSetFallbackWeaponsMaybe
	.thumb_func
ArenaSetFallbackWeaponsMaybe:
	push {r4, lr}
	ldr r4, _08031F34 @ =0x0203A8EC
	ldr r0, [r4]
	adds r1, r4, #0
	adds r1, #0x1a
	bl sub_8031EC0
	ldr r0, [r4, #4]
	adds r4, #0x1c
	adds r1, r4, #0
	bl sub_8031EC0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F34: .4byte 0x0203A8EC

