	.syntax unified
	.set GetLeaderLevelForSaveMenu, 0x080AF224 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80AF248, 0x080AF248 + 1
	.section .text.sub_808C0F8, "ax", %progbits
@ sub_808C0F8 @ JP 0x0808C0F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C0F8
	.thumb_func
sub_808C0F8:
	push {r4, lr}
	bl sub_80AF248
	adds r3, r0, #0
	cmp r3, #0
	beq _0808C114
	ldr r0, _0808C110 @ =0x0203E7A8
	movs r1, #0x1a
	movs r2, #7
	bl sub_80043B8
	b _0808C12A
	.align 2, 0
_0808C110: .4byte 0x0203E7A8
_0808C114:
	ldr r4, _0808C140 @ =0x0203E7A8
	movs r0, #0x99
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #7
	bl sub_80043B8
_0808C12A:
	bl GetLeaderLevelForSaveMenu
	adds r3, r0, #0
	cmp r3, #0
	blt _0808C144
	ldr r0, _0808C140 @ =0x0203E7A8
	movs r1, #0x74
	movs r2, #7
	bl sub_80043DC
	b _0808C158
	.align 2, 0
_0808C140: .4byte 0x0203E7A8
_0808C144:
	ldr r4, _0808C160 @ =0x0203E7A8
	ldr r0, _0808C164 @ =0x000004C5
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #7
	bl sub_80043B8
_0808C158:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808C160: .4byte 0x0203E7A8
_0808C164: .4byte 0x000004C5

