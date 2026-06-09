	.syntax unified
	.set BG_EnableSync, 0x08001F0C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C0FFC, "ax", %progbits
@ sub_80C0FFC @ JP 0x080C0FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0FFC
	.thumb_func
sub_80C0FFC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3e]
	adds r0, #1
	strh r0, [r6, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bge _080C1036
	movs r1, #0x3e
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	bl __divsi3
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b _080C1064
_080C1036:
	adds r0, r6, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_8001BC0
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl sub_8001BC0
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	bl sub_80D636C
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r0, r6, #0
	bl sub_8002DE4
_080C1064:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

