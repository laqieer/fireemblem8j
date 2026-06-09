	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set GetWeaponTypeDisplayString, 0x08016BC8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_808BF4C, "ax", %progbits
@ sub_808BF4C @ JP 0x0808BF4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808BF4C
	.thumb_func
sub_808BF4C:
	push {r4, lr}
	ldr r4, _0808BFCC @ =0x0203E7A8
	bl GetItemType
	bl GetWeaponTypeDisplayString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_80043B8
	ldr r0, _0808BFD0 @ =0x0000048F
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #8
	bl sub_80043B8
	ldr r0, _0808BFD4 @ =0x00000491
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl sub_80043B8
	adds r4, #8
	ldr r0, _0808BFD8 @ =0x00000492
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_80043B8
	ldr r0, _0808BFDC @ =0x00000483
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #8
	bl sub_80043B8
	movs r0, #0x92
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl sub_80043B8
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808BFCC: .4byte 0x0203E7A8
_0808BFD0: .4byte 0x0000048F
_0808BFD4: .4byte 0x00000491
_0808BFD8: .4byte 0x00000492
_0808BFDC: .4byte 0x00000483

