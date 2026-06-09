	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80880D4, "ax", %progbits
@ sub_80880D4 @ JP 0x080880D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80880D4
	.thumb_func
sub_80880D4:
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, _0808810C @ =0x02022CA8
	movs r5, #0x80
	lsls r5, r5, #2
	cmp r1, #0
	bne _080880E4
	subs r5, #0xc0
_080880E4:
	ldr r0, _08088110 @ =0x08A60B00
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl sub_8013008
	movs r1, #0xb0
	lsls r1, r1, #1
_080880F6:
	ldrh r0, [r4]
	adds r0, r0, r5
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080880F6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808810C: .4byte 0x02022CA8
_08088110: .4byte 0x08A60B00

