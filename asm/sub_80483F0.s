	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8042D6C, 0x08042D6C + 1
	.section .text.sub_80483F0, "ax", %progbits
@ sub_80483F0 @ JP 0x080483F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80483F0
	.thumb_func
sub_80483F0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_80043B8
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042D6C
	movs r0, #0xe9
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl sub_80043B8
	ldr r1, _08048438 @ =0x02022FC6
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048438: .4byte 0x02022FC6

