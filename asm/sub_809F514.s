	.syntax unified
	.set sub_8009FE4, 0x08009FE4 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B27C4, 0x080B27C4 + 1
	.section .text.sub_809F514, "ax", %progbits
@ sub_809F514 @ JP 0x0809F514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F514
	.thumb_func
sub_809F514:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809F554 @ =sub_809F4E0
	bl sub_80B1D98
	ldr r0, _0809F558 @ =0x08A94F38
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809F55C @ =0x08A94F44
	ldr r1, [r1]
	bl sub_8009FE4
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80B27C4
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F554: .4byte 0x0809F4E1  @ sub_809F4E0
_0809F558: .4byte 0x08A94F38
_0809F55C: .4byte 0x08A94F44

